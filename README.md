<!-- BACK TO TOP ANCHOR -->

<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]

<!-- PROJECT HEADER -->
<div align="center">
  <h3 align="center">bardsync</h3>
  <p align="center">
    Play sound effects and music in perfect sync, with everyone, everywhere.
    <br />
    <br />
    <a href="https://bardsync.pages.dev/">
        See live 🌐
    </a>
    &middot;
    <a href="https://github.com/velvetcode206/bardsync/issues/new?labels=bug&template=bug-report---.md">
        Report Bug
    </a>
    &middot;
    <a href="https://github.com/velvetcode206/bardsync/issues/new?labels=enhancement&template=feature-request---.md">
        Request Feature
    </a>
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
        <li><a href="#usage">Usage</a></li>
        <li><a href="#caveats">Caveats</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

This is a real-time soundboard application that allows multiple users to play and listen to music and sound effects simultaneously.

It’s designed to create a shared audio experience, making it easy for groups to enjoy the same sounds at the same time—whether for fun, collaboration, or entertainment.

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

### Built With

- [![github][github-shield]][github-url]
- [![github-actions][github-actions-shield]][github-actions-url]
- [![cloudflare][cloudflare-shield]][cloudflare-url]
- [![node][node-shield]][node-url]
- [![pnpm][pnpm-shield]][pnpm-url]
- [![nuxt][nuxt-shield]][nuxt-url]

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

<!-- GETTING STARTED -->

## Getting Started

Follow these instructions to set the project locally.

### Prerequisites

- pnpm is the default node package manager on the project

  ```sh
  npm install -g pnpm@12.4.2
  ```

  For other methods of installation on POSIX systems or Docker, refer to [PNPM documentation][pnpm-url]

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/velvetcode206/bardsync.git
   ```
2. Install node packages
   ```sh
   pnpm install
   ```

### Usage

- Running scripts are done primarly by `pnpm run` instead of `npm run`.
  - eg. `pnpm run dev`
- The commits use the commitizen and commitlint, to make use of the CLI tool try `pnpm commit`
  - If commit linting is undesired, comment the verification in the `.husky/commit-msg` file.

### Caveats

1. Signed commits are required by default. If this behaviour is undesired, comment the verification in the `.husky/commit-msg` file.

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

<!-- ROADMAP -->

## Roadmap

<details>
<summary><strong>📌 Full Roadmap</strong></summary>

### Phase 1: Planning & Requirements

- [ ] Identify MVP features
- [ ] Draft business logic, key entities, and data models
- [ ] Choose tech stack and services (e.g., frontend/backend frameworks, DBs, hosting)

### Phase 2: Infrastructure & Setup

- [ ] Plan and document infrastructure (CI/CD, environments, DB, storage)
- [ ] Create and initialize version-controlled repository
- [ ] Set up development, staging, and production environments
- [ ] Set up code quality tools (linters, formatters, pre-commit hooks)

### Phase 3: Development of MVP

- [ ] Scaffold project structure (frontend/backend)
- [ ] Implement core business logic and models
- [ ] Develop MVP features
- [ ] Add authentication, error handling, and basic security
- [ ] Implement basic tests (unit/integration)

### Phase 4: Testing & Launch

- [ ] Conduct internal QA and testing (manual/automated)
- [ ] Deploy MVP to staging
- [ ] Collect early non-public user feedback
- [ ] Fix critical bugs and polish UX
- [ ] Release MVP to production

### Phase 5: Post-MVP Iteration

- [ ] Monitor performance, analytics, and logs
- [ ] Collect user feedback
- [ ] Prioritize features and fixes for next iteration

</details>
<br />

See the [open issues][issues-url] for a full list of proposed features (and known issues).

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

<!-- CONTRIBUTING -->

## Contributing

Contributions help make open source awesome. Feel free to fork the repo and submit a pull request, or open an issue.

⭐ Star the project if you like it — greatly appreciated!

<details>
<summary><strong>📑 How to contribute</strong></summary>

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/CoolFeature`)
3. Commit your changes (`git commit -m 'feat: add some CoolFeature'`)
4. Push to the branch (`git push origin feature/CoolFeature`)
5. Open a pull request

</details>

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

### Top contributors:

<a href="https://github.com/velvetcode206/bardsync/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=velvetcode206/bardsync" alt="contrib.rocks image" />
</a>

<!-- LICENSE -->

## License

Distributed under the GNU General Public License v3.0. See [LICENSE][license-url] for more information.

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Choose an Open Source License][choose-a-license-url]
- [Readme Shields][shields-url]

<p align="right"><a href="#readme-top">⬆ back to top</a></p>

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/velvetcode206/bardsync.svg?style=for-the-badge
[contributors-url]: https://github.com/velvetcode206/bardsync/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/velvetcode206/bardsync.svg?style=for-the-badge
[forks-url]: https://github.com/velvetcode206/bardsync/network/members
[stars-shield]: https://img.shields.io/github/stars/velvetcode206/bardsync.svg?style=for-the-badge
[stars-url]: https://github.com/velvetcode206/bardsync/stargazers
[issues-shield]: https://img.shields.io/github/issues/velvetcode206/bardsync.svg?style=for-the-badge
[issues-url]: https://github.com/velvetcode206/bardsync/issues
[license-shield]: https://img.shields.io/github/license/velvetcode206/bardsync.svg?style=for-the-badge
[license-url]: https://github.com/velvetcode206/bardsync/blob/main/LICENSE
[github-shield]: https://img.shields.io/badge/github-versioning-000000?style=for-the-badge&logo=github&logoColor=ffffff&labelColor=181717
[github-url]: https://docs.github.com/en/actions/
[github-actions-shield]: https://img.shields.io/badge/github%20actions-ci/cd%20pipeline-000000?style=for-the-badge&logo=githubactions&logoColor=ffffff&labelColor=2088FF
[github-actions-url]: https://docs.github.com/en/actions/
[node-shield]: https://img.shields.io/badge/node-javascript%20runtime%20environment-000000?style=for-the-badge&logo=nodedotjs&logoColor=ffffff&labelColor=5FA04E
[node-url]: https://pnpm.io/installation/
[pnpm-shield]: https://img.shields.io/badge/pnpm-node%20package%20manager-000000?style=for-the-badge&logo=pnpm&logoColor=ffffff&labelColor=f69220
[pnpm-url]: https://pnpm.io/installation/
[cloudflare-shield]: https://img.shields.io/badge/Clouflare-cloud%20provider-000000?style=for-the-badge&logo=cloudflare&logoColor=ffffff&labelColor=F38020
[cloudflare-url]: https://www.cloudflare.com/
[nuxt-shield]: https://img.shields.io/badge/nuxt4-web%20framework-000000?style=for-the-badge&logo=nuxt&logoColor=ffffff&labelColor=00DC82
[nuxt-url]: https://nuxt.com/
[choose-a-license-url]: https://choosealicense.com
[shields-url]: https://shields.io
