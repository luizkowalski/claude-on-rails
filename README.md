# ClaudeOnRails

A Rails development framework that leverages [claude-swarm](https://github.com/parruda/claude-swarm) to create an intelligent team of AI agents specialized in different aspects of Rails development.

Instead of managing personas manually, ClaudeOnRails automatically orchestrates a swarm of specialized agents that work together like a real development team. Simply describe what you want to build, and the swarm handles the rest.

## How It Works

ClaudeOnRails creates a team of specialized AI agents:

- **Architect**: Coordinates development and makes high-level decisions
- **Models**: Handles ActiveRecord, migrations, and database design
- **Controllers**: Manages routing and request handling
- **Views**: Creates UI templates and manages assets
- **Services**: Implements business logic and service objects
- **Tests**: Ensures comprehensive test coverage
- **DevOps**: Handles deployment and infrastructure

Each agent works in their specific domain (directory) and can collaborate with other agents to implement complex features.

## Installation

Add to your Rails application's Gemfile:

```ruby
group :development do
  gem 'claude-on-rails'
end
```

Then run:

```bash
bundle install
rails generate claude_on_rails:swarm
```

This will:
- Analyze your Rails project structure
- Generate a customized swarm configuration
- Create agent-specific prompts
- Set up your development environment

## Usage

### Start Your Development Swarm

```bash
# In your Rails project directory
claude-swarm orchestrate
```

### Natural Language Development

Just describe what you want to build:

```bash
# The architect will coordinate the implementation
claude "Add user authentication with email confirmation"

# Complex features are automatically broken down
claude "Create a shopping cart with Stripe payment integration"

# Performance improvements across the stack
claude "Optimize the dashboard - it's loading too slowly"

# API development
claude "Build a RESTful API for our mobile app with JWT auth"
```

The swarm automatically:
- Analyzes your request
- Delegates to appropriate specialists
- Implements across all layers (models, controllers, views, tests)
- Follows Rails best practices
- Ensures test coverage

## How It's Different

### Traditional Rails Development with AI
When using AI assistants for Rails development, you typically need to:
- Manually coordinate different aspects of implementation
- Switch contexts between models, controllers, views, and tests
- Ensure consistency across different parts of your application
- Remember to implement tests, security, and performance considerations

### ClaudeOnRails Approach
With ClaudeOnRails, you simply describe what you want:
```bash
claude "Create a user system with social login"
```

The swarm automatically:
- Creates models with proper validations and associations
- Implements controllers with authentication logic
- Builds views with forms and UI components
- Adds comprehensive test coverage
- Handles security considerations
- Optimizes database queries

All coordinated by specialized agents working together.

## Project Structure

After running the generator, you'll have:

```
your-rails-app/
├── swarm.yml                    # Swarm configuration
├── CLAUDE.md                    # Project-specific Claude config
└── .claude-on-rails/
    └── prompts/                 # Agent-specific prompts
        ├── architect.md
        ├── models.md
        ├── controllers.md
        └── ...
```

## Customization

### Swarm Configuration

The generated `swarm.yml` can be customized:

```yaml
instances:
  architect:
    description: "Your project-specific architect description"
    connections: [models, controllers, custom_agent]
  
  custom_agent:
    description: "Specialized agent for your domain"
    directory: ./app/custom
    prompt_file: .claude-on-rails/prompts/custom.md
```

### Agent Prompts

Customize agent behavior by editing prompts in `.claude-on-rails/prompts/`:
- Add project-specific conventions
- Include domain knowledge
- Define coding standards

## Features

- **Automatic Agent Selection**: No need to choose which persona to use
- **Collaborative Implementation**: Agents work together like a real team
- **Rails-Aware**: Deep understanding of Rails conventions and best practices
- **Project Adaptation**: Detects your project structure and adapts accordingly
- **Test-Driven**: Automatic test generation for all code
- **Performance Focus**: Built-in optimization capabilities

## Requirements

- Ruby 2.7+
- Rails 6.0+
- [claude-swarm](https://github.com/parruda/claude-swarm) gem
- Claude Code CLI

## Examples

See the [examples](./examples) directory for:
- E-commerce platform development
- API-only applications
- Real-time features with Turbo/Stimulus
- Performance optimization workflows

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](./LICENSE) for details.

## Acknowledgments

- Powered by [claude-swarm](https://github.com/parruda/claude-swarm)
- Built for [Claude Code](https://github.com/anthropics/claude-code)
- Integrates with [Rails MCP Server](https://github.com/mariochavez/rails-mcp-server)