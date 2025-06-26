# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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