# ClaudeOnRails Configuration

Welcome to ClaudeOnRails - A specialized development framework for Ruby on Rails developers using Claude Code.

## Framework Philosophy

ClaudeOnRails enhances Claude Code with Rails-specific expertise, following these principles:
- **Convention over Configuration**: Embrace Rails conventions
- **Test-Driven Development**: Tests are first-class citizens
- **Performance by Default**: Optimize from the start
- **Security First**: Built-in security best practices
- **Documentation Matters**: Clear, maintainable code

## Core Configuration

@include .claude-on-rails/shared/claude-on-rails-core.yml
@include .claude-on-rails/shared/claude-on-rails-personas.yml
@include .claude-on-rails/shared/claude-on-rails-patterns.yml
@include .claude-on-rails/shared/claude-on-rails-conventions.yml

## Available Commands

### Rails Development
@include .claude-on-rails/commands/rails/generate.md
@include .claude-on-rails/commands/rails/migrate.md
@include .claude-on-rails/commands/rails/console.md
@include .claude-on-rails/commands/rails/routes.md

### Testing
@include .claude-on-rails/commands/testing/suite.md
@include .claude-on-rails/commands/testing/coverage.md
@include .claude-on-rails/commands/testing/performance.md

### Optimization
@include .claude-on-rails/commands/optimization/queries.md
@include .claude-on-rails/commands/optimization/assets.md
@include .claude-on-rails/commands/optimization/cache.md

## MCP Integration

When Rails MCP Server is available, ClaudeOnRails automatically integrates with:
- Rails Guides documentation
- Turbo framework documentation
- Stimulus framework documentation
- Kamal deployment documentation
- Custom project documentation

## Session Management

ClaudeOnRails maintains context throughout your development session:
- Active persona state
- Command history
- Documentation references
- Project-specific patterns

## Getting Started

1. Choose a persona based on your task
2. Use specialized commands for Rails operations
3. Leverage integrated documentation
4. Follow suggested best practices

Example workflow:
```bash
claude "/rails generate model User --persona-rails-architect --with-tests"
claude "/test-suite --persona-testing"
claude "/optimize-queries --persona-performance"
```