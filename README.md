# Symfony 7 Multilingual Hello World App

This Symfony 7 application serves a simple "Hello, World!" message in two languages based on the URL route:

- `/es/hello-world` serves the message in Spanish.
- `/en/hello-world` serves the message in English.

## Prerequisites

- PHP 8.2 or higher
- Composer
- Symfony CLI (optional)

## Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/VGzsysadm/symfony-locale-demo-app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd symfony-locale-demo-app
    ```

3. Install dependencies:

    ```bash
    composer install
    ```

## Usage

1. Start the Symfony server:

    ```bash
    symfony server:start
    ```

2. Open your browser and visit:

    - [http://localhost:8000/es/hello-world](http://localhost:8000/es/hello-world) for Spanish.
    - [http://localhost:8000/en/hello-world](http://localhost:8000/en/hello-world) for English.

You should see the respective "Hello friend" message in the language specified in the URL.

## Docker image

1. Just docker run:
    
    ```bash
    docker run -d -p 80:80 vgzsysadm/symfony-locale-demo
    ```
    

## Localization

Localization files can be found in the `translations/` directory. You can add more translations or modify the existing ones to support additional languages.

## License

This project is licensed under the [MIT License](LICENSE).
