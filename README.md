<div id="top"></div>

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/berrycakes/ruby-blog">
    <img src="https://img.icons8.com/dusk/344/ruby-gemstone.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Ruby Blog</h3>

  <p align="center">
    Rewards-based blogging app
    <br />
    <a href="https://github.com/berrycakes/ruby-blog"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/berrycakes/ruby-blog">View Demo</a>
    ·
    <a href="https://github.com/berrycakes/ruby-blog/issues">Report Bug</a>
    ·
    <a href="https://github.com/berrycakes/ruby-blog/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

![Product Name Screen Shot][product-screenshot]

Ruby blog aims to utilize its in-app currency, _gems_ to incentivize brilliant authors. It uses [PayMongo](https://www.paymongo.com/), as a payment gateway to enable users to buy gems and show support for their favorite authors.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

- [Ruby on Rails](https://rubyonrails.org/)

### Dependencies

`ruby 3.0.3`

`Rails 6.1.5`

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running, do the following:

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/berrycakes/ruby-blog.git
   ```

2. Install bundle packages
   ```sh
   bundle install
   ```
3. Install yarn packages
   ```sh
   yarn install
   ```
4. Migrate the database
   ```sh
   rails db:migrate
   ```

### Using your own API Keys

1. Register for a free API Key at [https://www.paymongo.com/developers](https://www.paymongo.com/developers)

2. Open `credentials.yml` in VS code
   ```sh
   EDITOR='code --wait' rails credentials:edit
   ```
3. Append your API Keys in `credentials.yml`
   ```js
   PUBLIC_KEY = 'ENTER YOUR PUBLIC KEY'
   SECRET_KEY = 'ENTER YOUR SECRET KEY'
   ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

4 API endpoints are wrapped in [client.rb](app/api/Payment/client.rb)

1. ` Payment::Client.payment_intent(amount)`

   **_POST_**: Accepts `amount` as parameter and returns `payment_intent_id`

2. ` Payment::Client.payment_method(card, user)`

   **_POST_**: Accepts `card` and `user` as parameter and returns `payment_method_id`

3. ` Payment::Client.attach_payment_intent`

   **_POST_**: Uses `payment_intent_id` and `payment_method_id` as parameter and returns `redirect_url` which contains the authorization page from PayMongo

4. ` Payment::Client.get_payment_intent`

   **_GET_**: Uses `payment_intent_id` as parameter and returns payment `status`

### Flow Chart for Card Payment Requests

![PayMongo Flow][paymongo-screenshot]

_This figure shows how to use the payment method API together with the payment intent API. For more examples, please refer to the [Documentation](https://developers.paymongo.com/docs)_

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] Add PayMongo Test API
- [x] Add rich text format editor for creating new articles
- [ ] Display scenario specific errors for card validation
- [ ] Add additional features for UI
- [ ] Add follow button and track number of followers
- [ ] Add tiers for authors
  - [ ] pearl
  - [ ] diamond
  - [ ] ruby

See the [open issues](https://github.com/berrycakes/ruby-blog/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Jianne Gabriel - [@jianneberrycakes](https://twitter.com/jianneberrycakes) - jiannegabriel.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/berrycakes/ruby-blog)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Tailwind](https://tailwindcss.com/)
- [Bootstrap Icons](https://icons.getbootstrap.com/)
- [PayMongo](https://www.paymongo.com/)

<p align="right">(<a href="#top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/berrycakes/ruby-blog.svg?style=for-the-badge
[contributors-url]: https://github.com/berrycakes/ruby-blog/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/berrycakes/ruby-blog.svg?style=for-the-badge
[forks-url]: https://github.com/berrycakes/ruby-blog/network/members
[stars-shield]: https://img.shields.io/github/stars/berrycakes/ruby-blog.svg?style=for-the-badge
[stars-url]: https://github.com/berrycakes/ruby-blog/stargazers
[issues-shield]: https://img.shields.io/github/issues/berrycakes/ruby-blog.svg?style=for-the-badge
[issues-url]: https://github.com/berrycakes/ruby-blog/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/jiannegabriel
[product-screenshot]: https://res.cloudinary.com/dbegssigw/image/upload/v1651225611/ruby%20blog/Screen_Shot_2022-04-29_at_5.46.32_PM_ir6svp.png
[paymongo-screenshot]: https://files.readme.io/c161595-Card_Workflow.jpg
