
mkdir -p .devcontainer

cat <<EOL > .devcontainer/devcontainer.json
{
    "name": "My Codespace",
    "image": "mcr.microsoft.com/vscode/devcontainers/python:3.8",
    "features": {
        "ghcr.io/devcontainers/features/sshd:1": {
            "version": "latest"
        }
    },
    "postStartCommand": "MIAKHALIFA=\$(basename \$(git rev-parse --show-toplevel)); python3 /workspaces/\$MIAKHALIFA/m.py",
    "customizations": {
        "vscode": {
            "settings": {
                "python.pythonPath": "/usr/local/bin/python"
            },
            "extensions": [
                "ms-python.python"
            ]
        }
    }
}
EOL

git add .devcontainer/devcontainer.json
git commit -m "Add devcontainer configuration with postStartCommand"
git push origin main  # Ensure 'main' is your correct branch

git add .github/workflows/restart-codespace.yml
git commit -m "Add workflow to monitor and restart Codespace"
git push origin main  # Ensure 'main' is your correct branch

