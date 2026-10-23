CURRENT UPDATE: Read docs/EVERYDAY_GUIDE.md for natural conversations, fan/custom controls, meetings and camera/screen help.

# AURA + ORBIT — complete hackathon project

One local conversation for personal records, lab help and simulated robot/home actions.

**Start here: [START_HERE.md](START_HERE.md)**. No Echo, robot, paid API or Ollama is required for the car-keys demo. Optional Ollama adds free-form conversation. This is an Alexa-style simulation, not an Amazon Alexa integration.

## Organization

```
AURA_Hackathon_Complete/
  START_HERE.md                 Complete install, start and demo steps
  01_SETUP.bat                 Install Python dependencies
  02_START.bat                 Start the conversation window
  03_TEST.bat                  Run core + HTTP/MCP tests
  04_SETUP_BROWSER_TESTS.bat   Optional Node/Playwright setup
  05_TEST_WITH_BROWSER.bat    Include isolated Edge end-to-end test
  app/                        All Python, HTML, configuration and test source
    package.json              Optional Node test dependency
    package-lock.json         Exact Node dependency resolution
    requirements-lock.txt     Exact Python dependencies
  docs/                       GitHub, architecture, demo and original documentation
  previews/                   Screenshots from tested demonstrations
  .github/workflows/          Windows test workflow for GitHub
  MANIFEST_SHA256.txt          Archive file integrity list
```

This contains all available source built in this chat, including the unified assistant and the contextual keys-delivery update. The old HomeGuardian/AURA v3-v6 ZIPs mentioned in the earlier ChatGPT conversation were not available locally and are **not** included. This bundle does not claim to recreate their source.

Python/Node/Ollama installers, downloaded models, .venv and node_modules are not bundled. Setup downloads dependencies. Node is optional and only used for browser testing. No personal SQLite database, access token, private key or runtime log is included. Fresh memory and a fresh token are created on first launch.

Nothing has been uploaded to GitHub. See [docs/GITHUB.md](docs/GITHUB.md) to publish this folder to your own repository. The included workflow has not run on GitHub yet. No project license has been selected; choose one deliberately before licensing your source publicly. Dependencies retain their own licenses.
