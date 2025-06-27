# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.4] - 2025-01-27

### Fixed
- Fixed CLAUDE.md overwriting user's existing directives
- Now uses Claude's file reference syntax (@file) to include context
- Fixed swarm configuration filename (claude-swarm.yml not swarm.yml)
- Updated documentation to clarify prompts vs commands
- Improved generator to preserve existing CLAUDE.md content

### Changed
- ClaudeOnRails context now stored in `.claude-on-rails/context.md`
- CLAUDE.md uses file references instead of appending content
- Clearer distinction between shell commands and Claude prompts
- Updated .gitignore to include `.claude-swarm/` directory

## [0.1.3] - 2025-01-26

### Fixed
- Only create swarm agents for directories that actually exist
- Changed model from full model name to claude-swarm compatible names (opus/haiku/sonnet)
- Fixed controllers connections to only include services if directory exists

### Changed
- Default model is now "opus" for all agents
- Generator now shows which agents will be created during analysis

### Improved
- Swarm configuration template now checks for directory existence before creating agents
- Better handling of optional directories like app/services, app/jobs, etc.

## [0.1.2] - 2025-01-26

### Fixed
- Fixed generator requiring claude_on_rails module
- Changed generated filename from swarm.yml to claude-swarm.yml (expected by claude-swarm CLI)
- Removed incorrect "orchestrate" command from documentation
- Fixed installation instructions (removed redundant gem install step)
- Added missing prompt templates for all agent types
- Corrected prompt syntax examples to use > prefix

### Added
- Created prompt templates for views, api, jobs, devops, graphql, and stimulus agents

## [0.1.1] - 2025-01-26

### Fixed
- Fixed dependency on claude_swarm gem (correct name with underscore)
- Updated documentation to clarify installation requirements

## [0.1.0] - 2025-01-26

### Added
- Initial release of ClaudeOnRails
- Rails generator for creating swarm configurations
- Project structure analyzer to detect Rails patterns
- Intelligent agent topology based on project type
- Support for API-only and full-stack Rails applications
- Agent-specific prompts for different Rails domains
- Integration with claude-swarm for orchestration
- Automatic detection of testing frameworks (RSpec/Minitest)
- GraphQL and Turbo/Stimulus detection
- Customizable swarm configurations

### Architecture
- Leverages claude-swarm instead of manual persona management
- Agents work in specific directories (MVC separation)
- Automatic task delegation based on context
- Natural language interface for development tasks