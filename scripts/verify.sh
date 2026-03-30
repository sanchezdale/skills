#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ruby - "$repo_root" <<'RUBY'
require "yaml"

repo_root = ARGV[0]
paths = Dir[File.join(repo_root, "skills", "*", "SKILL.md")].sort
bundle_path = File.join(repo_root, "bundle.yaml")

if paths.empty?
  warn "No skills found under #{File.join(repo_root, "skills")}"
  exit 1
end

unless File.exist?(bundle_path)
  warn "Missing bundle.yaml"
  exit 1
end

bundle = YAML.safe_load(File.read(bundle_path))
bundle_skills = Array(bundle["skills"]).sort
repo_skills = []

paths.each do |path|
  text = File.read(path)
  parts = text.split(/^---\s*$\n?/)
  frontmatter = parts[1]

  if frontmatter.nil?
    warn "Missing YAML frontmatter: #{path}"
    exit 1
  end

  data = YAML.safe_load(frontmatter)

  unless data.is_a?(Hash) && data["name"].is_a?(String) && data["description"].is_a?(String)
    warn "Invalid skill metadata: #{path}"
    exit 1
  end

  skill_name = File.basename(File.dirname(path))
  repo_skills << skill_name
  puts "#{skill_name}: OK"
end

repo_skills.sort!

unless bundle_skills == repo_skills
  warn "bundle.yaml skills do not match repo skills"
  warn "bundle: #{bundle_skills.inspect}"
  warn "repo:   #{repo_skills.inspect}"
  exit 1
end
RUBY
