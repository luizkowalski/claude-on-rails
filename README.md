# ClaudeOnRails

A development framework for Ruby on Rails developers using Claude Code, inspired by [SuperClaude](https://github.com/NomenAK/SuperClaude).

ClaudeOnRails transforms Claude Code into a Rails-specific development assistant by providing specialized personas, commands, and deep integration with the Rails ecosystem.

## Features

### 🎭 Rails-Specific Personas

- **rails-architect**: Domain modeling, Rails patterns, database design
- **api-designer**: RESTful APIs, GraphQL, versioning strategies
- **hotwire-specialist**: Turbo, Stimulus, modern Rails frontend
- **testing-expert**: RSpec/Minitest, factories, integration testing
- **performance-optimizer**: Query optimization, caching, background jobs
- **security-guardian**: Rails security, authentication, best practices
- **devops-engineer**: Deployment, Docker, CI/CD pipelines
- **gem-craftsman**: Gem selection, development, dependency management

### 📝 Specialized Commands

#### Development
- `/rails generate` - Enhanced generators with best practices
- `/rails migrate` - Migration assistant with rollback safety
- `/rails console` - Interactive console with query optimization
- `/rails routes` - Route analysis and optimization

#### Analysis
- `/analyze-models` - Active Record model analysis
- `/analyze-queries` - SQL performance analysis
- `/analyze-gems` - Dependency audit and updates
- `/analyze-security` - Brakeman integration

#### Testing
- `/test-suite` - Comprehensive test generation
- `/test-coverage` - Coverage analysis
- `/test-performance` - Performance test creation

#### Optimization
- `/optimize-queries` - N+1 detection and fixes
- `/optimize-assets` - Asset pipeline optimization
- `/optimize-cache` - Caching strategy implementation

### 🔌 MCP Integration

ClaudeOnRails integrates with the [Rails MCP Server](https://github.com/mariochavez/rails-mcp-server) to provide:
- Always-current Rails documentation
- Turbo and Stimulus framework docs
- Kamal deployment guides
- Custom project documentation

## Installation

```bash
# Clone the repository
git clone https://github.com/obie/claude-on-rails.git
cd claude-on-rails

# Run the installer
./install.rb

# Configure MCP servers (optional but recommended)
rails-mcp-server-download-resources rails
rails-mcp-server-download-resources turbo
rails-mcp-server-download-resources stimulus

# Import your project documentation
rails-mcp-server-download-resources --file ./docs/
```

## Usage

### Basic Commands

```bash
# Generate a model with best practices
claude "/rails generate model Order --persona-rails-architect --with-tests"

# Create an API endpoint
claude "/rails api posts --persona-api-designer --version=v2"

# Optimize database queries
claude "/optimize-queries --persona-performance --analyze"

# Run comprehensive tests
claude "/test-suite --persona-testing --coverage"
```

### Using Personas

Personas provide specialized expertise for different aspects of Rails development:

```bash
# Architecture decisions
claude "Design a multi-tenant system" --persona-rails-architect

# API development
claude "Create GraphQL endpoint for orders" --persona-api-designer

# Performance optimization
claude "Improve dashboard loading time" --persona-performance
```

## Project Structure

```
.claude-on-rails/
├── commands/
│   ├── rails/          # Rails-specific commands
│   ├── gems/           # Gem management commands
│   ├── testing/        # Testing commands
│   ├── optimization/   # Performance commands
│   └── shared/         # Reusable patterns
└── shared/
    ├── claude-on-rails-core.yml
    ├── claude-on-rails-personas.yml
    ├── claude-on-rails-patterns.yml
    └── claude-on-rails-conventions.yml
```

## Configuration

The main configuration file `CLAUDE.md` ties everything together:

```markdown
# ClaudeOnRails Configuration

@include .claude-on-rails/shared/claude-on-rails-core.yml
@include .claude-on-rails/shared/claude-on-rails-personas.yml
@include .claude-on-rails/shared/claude-on-rails-patterns.yml
```

## Examples

See the [examples](./examples) directory for detailed usage scenarios:
- Model generation with associations
- API development workflow
- Performance optimization cases
- Testing strategies

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](./LICENSE) for details.

## Acknowledgments

- Inspired by [SuperClaude](https://github.com/NomenAK/SuperClaude)
- Built for [Claude Code](https://github.com/anthropics/claude-code)
- Integrates with [Rails MCP Server](https://github.com/mariochavez/rails-mcp-server)