## Project Status

🚧 **Work in Progress** 🚧

I'm actively working on this project and will be updating the repository regularly. Feel free to check back for the latest features and code additions. Your feedback and opinion are always welcome!

---

## README

This README provides an overview of the steps necessary to get the Ruby on Rails application up and running. Please follow the instructions below:

### Prerequisites

- Ruby version: 3.2.2
- Rails version: 7.1.2
- Database: SQLite3 (version 1.4)
- Web server: Puma (version 5.0)

### Installation

1. Clone the repository to your local machine:

    ```bash
    git clone <repository_url>
    ```

2. Install the required gems:

    ```bash
    bundle install
    ```

3. Create the database and run migrations:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. Start the Puma server:

    ```bash
    rails server
    ```

### Configuration

#### Database Configuration

- Ensure you have SQLite3 installed.
- Update the `config/database.yml` file if necessary.

#### Environment Variables

- Set any required environment variables in the `.env` file.

### How to Run the Test Suite

To run the test suite, use the following command:

```bash
rails test
```

### Services

- Ensure the following services are set up and running:
  - Job queues
  - Cache servers
  - Search engines

### Deployment Instructions

- Coming soon.

### Additional Configuration

#### Active Storage

- Active Storage variants are used for transforming images. Follow [Active Storage Overview](https://guides.rubyonrails.org/active_storage_overview.html#transforming-images) for additional configuration.

#### Development Environment

- Consider uncommenting and using additional gems in the development group based on your preferences.

#### Test Environment

- System testing is set up. Adjust configurations in the test group as needed.

### Dependencies

- Review the Gemfile for additional gems and their purposes.
