## Project Status

🚧 **Work in Progress** 🚧

I'm actively working on this project and will be updating the repository regularly. Feel free to check back for the latest features and code additions. Your feedback and opinion are always welcome!

---

### 👉[Demo](https://mopp-app-f094fba44bf3.herokuapp.com/){:target="_blank"}


![m1](https://github.com/samojeyinka/MultiB-Online-publishing-platform/assets/131479901/d1039df7-5b5b-4fe0-95ef-c066af11e715)
![m2](https://github.com/samojeyinka/MultiB-Online-publishing-platform/assets/131479901/a786e63f-839b-47d1-91ae-12cc5b632c0a)
![m3](https://github.com/samojeyinka/MultiB-Online-publishing-platform/assets/131479901/84c673da-6e7b-44eb-ad71-a73c68520e8c)
![m4](https://github.com/samojeyinka/MultiB-Online-publishing-platform/assets/131479901/a4b5743f-6c6b-492b-9945-0ca255aa10b2)
![m5](https://github.com/samojeyinka/MultiB-Online-publishing-platform/assets/131479901/4ec51b45-bb97-4a88-8ae4-39d74723769b)
![m6](https://github.com/samojeyinka/MultiB-Online-publishing-platform/assets/131479901/d10b99ca-775e-43d6-a9bd-3e30298edba2)




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
