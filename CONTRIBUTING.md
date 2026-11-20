# Contributing

We are happy to accept contributions that follow the guidelines below.

## How to contribute

1. Fork the repository.
2. Create a feature branch out of `master` for your change.
3. Implement your changes and add/update tests in `test/db.test.mjs`.
4. Run `npm test` (requires Node.js >= 22.12) to verify all checks pass.
5. Submit a pull request against `master`.

## Guidelines

* **Do** use feature branches (one logical change per pull request).
* **Do** match the existing coding style (2-space indentation, single quotes, no semicolons in `.js`/`.mjs`).
* **Do** keep published package contents minimal via the `"files"` field in [package.json](package.json).
* **Do not** manually edit `version` in [package.json](package.json) for routine PRs.
* **Do not** hand-edit `dist/devices.json`; update `scripts/build-db.mjs` and rebuild via `npm run build` instead.

## License

By contributing to this repository, you agree to license your contributions under our licenses: [LICENSE](LICENSE) for code and [dist/LICENSE](dist/LICENSE) for data.
