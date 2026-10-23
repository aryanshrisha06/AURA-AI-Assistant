CURRENT UPDATE: Read docs/EVERYDAY_GUIDE.md for natural conversations, fan/custom controls, meetings and camera/screen help.

# Start AURA from the beginning — Windows 11

## 1. Download and extract

Right-click `AURA_Hackathon_Complete.zip` → **Extract All**. Choose a simple folder such as `C:\AURA-Demo`. Open the extracted `AURA_Hackathon_Complete` folder. Do not run files inside the ZIP.

You do not need to copy files into an old HomeGuardian folder. Keep this project separate.

## 2. Install Python 3.12

Install Python **3.12, 64-bit** from [python.org](https://www.python.org/downloads/windows/), including its Windows launcher. Select “Add Python to PATH” if offered. Python 3.12.14 was used for the original build. Check in a new PowerShell window:

```powershell
py -3.12 --version
```

If that prints Python 3.12.x, continue. Another Python version alone does not satisfy the setup script. Node is not needed to launch AURA.

## 3. Install AURA dependencies

Double-click **01_SETUP.bat**. Internet is required for this initial dependency download. Wait for “Setup complete”. The installer creates `app\.venv`; it does not upgrade your other projects' Python libraries.

If an error appears, keep the window open and read it. Do not continue until setup succeeds. Command-line equivalent from the extracted top-level folder:

```powershell
cd app
py -3.12 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements-lock.txt
```

## 4. Start the assistant

Double-click **02_START.bat**. Leave its console window running. Your browser should open [http://127.0.0.1:8765](http://127.0.0.1:8765). If it does not, open that address manually.

This opens a single conversation page. The MCP endpoint is `http://127.0.0.1:8765/mcp`; it is a protocol endpoint, not the page you browse to. No API key is needed for ordinary use. If another AURA instance is already using this port, the launcher opens that instance. Stop the old one first when switching project copies.

## 5. Demonstrate forgotten keys

1. Click **Keys demo**.
2. Confirm the setup: robot in bedroom, keys in bedroom, you in hall.
3. Type **Alexa, ohh I forgot my car keys** and Send.
4. AURA offers to collect the keys and bring them to you.
5. Click **Confirm**.
6. Show the completed simulation steps: pickup in bedroom, navigation to hall and handoff.

This demo works with no Ollama, Alexa device or real robot. It is an instantaneous symbolic simulation with a result list, not an animation or real robot telemetry. Clicking Keys demo again resets the three simulated locations after confirmation.

Try a different pickup location:

```
My robot is in the bedroom, I am in the hall, and my car keys are in the lab
```

Confirm, then say “I forgot my car keys”. The planned route is bedroom → hall → lab → hall. “Show locations” displays the stored context. After 15 minutes, update your location before requesting another delivery.

## 6. Use speech or text

Click **Speak**, allow microphone access, speak, review the transcript and Send. Browser speech recognition may use its online service. If unsupported, click the message box and use Windows **Win+H**, or type. “Read replies” enables speech output. “Alexa” is only a recognized phrase prefix here; always-on wake-word listening is disabled.

## 7. Other features

Enter one request at a time and review confirmations:

```
remember that my robot is Atlas
add project: Atlas helper | | Goal: carry lightweight items
add step: Bench test | | Power disconnected; inspected connectors
show projects
add exam: Controls | 2026-11-02T09:00+04:00 | Example date only
plan revision for Controls
prepare my day
add wardrobe: Blue shirt | | college; clean; top
what should I wear for college?
add vehicle: My car | | Enter actual make/model/year here
check my car
turn on the light
```

Dates are examples, not your actual exam schedule. Use Dubai timezone `+04:00`. A record follows `add TYPE: title | date | details`; leave the date blank for undated records. The Memory button shows stored records; Export downloads them. “Delete record ID” deletes a record after confirmation. “Clear memory” removes saved records and chat history after confirmation. Reminders only appear while the page/server is open or as overdue items after reopening.

## 8. Optional free-form AI with Ollama

Install [Ollama for Windows](https://ollama.com/download/windows), start it, and open PowerShell:

```powershell
ollama pull qwen2.5:3b
ollama list
```

The model download requires internet, disk space and adequate memory. If Ollama is not running, use `ollama serve` in another window. AURA's default configuration already names `qwen2.5:3b`. For a different model, edit `app/config.json` → `AURA_MODEL` and restart AURA.

Local AI calls go to `127.0.0.1:11434`. AURA's header reports detected models; an absent model means command mode still works. Actual Ollama generation was not available during the original build and has not been verified here. Optional image descriptions require a local vision model and `AURA_VISION_MODEL`; ordinary text-specification uploads work without it. No actual devices, university calendars, car diagnostics or Amazon accounts are connected.

## 9. Run the tests

Double-click **03_TEST.bat**. The portable bundle defaults to 49 core/integration tests plus one skipped optional browser test. These tests use temporary databases and a temporary local server, not your personal AURA database.

For the optional Node browser check:

1. Install [Node.js LTS](https://nodejs.org/) and Microsoft Edge.
2. Open **04_SETUP_BROWSER_TESTS.bat**. It runs `npm ci` using `app/package-lock.json`.
3. Open **05_TEST_WITH_BROWSER.bat**. Expect 50 tests with the Edge check enabled.

The app itself does not need Node or npm. Playwright browser tests are the only Node component. Corporate Edge policies or disabled browser automation can prevent that optional check. Do not disable organization security settings to run it.

## 10. Stop, restart and keep your memory

Press Ctrl+C in the original server console or close that console. Closing only the browser leaves the server running. Start again with **02_START.bat**. Your confirmed records are in `app/data/aura.sqlite3`. Back up `app/data` while AURA is stopped. Keep the database and `access.token` private; do not upload them to GitHub.

If port 8765 is busy, stop the earlier AURA instance or change `AURA_PORT` in `app/config.json`, for example to 8766, then restart and use that new address. Do not stop unrelated Python processes.

## 11. GitHub and sharing

See [docs/GITHUB.md](docs/GITHUB.md). Upload the extracted source folder, not .venv, node_modules, private data or a running environment. Other people install their own dependencies using the same steps. The ZIP is source-complete for this implementation, but it is not an offline installer.

More detail: [docs/KEYS_DEMO.md](docs/KEYS_DEMO.md), [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md), and the original [docs/README.md](docs/README.md). The original inspection and setup notes describe the build laptop; paths in those historical documents are not required on your computer.


## Launcher repair (22 October 2026)
Setup now detects an existing compatible Codex Python 3.12 runtime on this laptop, or uses installed Python 3.12 via the Windows launcher. Failures keep the console open and save app/setup-log.txt or app/start-log.txt. Run 01_SETUP.bat once, then 02_START.bat.
