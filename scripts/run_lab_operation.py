import json
import os
import subprocess
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LAB_DIR = Path(os.environ.get("LAB_DIR", str(ROOT / "lab")))
OUT = ROOT / "artifacts"
OUT.mkdir(parents=True, exist_ok=True)

command = "hostname; uname -s; uname -r; cat /etc/os-release"
result = subprocess.run(
    ["vagrant", "ssh", "-c", command],
    cwd=LAB_DIR,
    capture_output=True,
    text=True,
    timeout=120,
)

record = {
    "timestamp_utc": datetime.now(timezone.utc).isoformat(),
    "technique_id": "T1082",
    "technique_name": "System Information Discovery",
    "command": command,
    "executed": result.returncode == 0,
    "exit_code": result.returncode,
    "stdout": result.stdout,
    "stderr": result.stderr,
    "execution_passed": result.returncode == 0,
    "detection_verified": False,
}

(OUT / "operation-results.json").write_text(
    json.dumps(record, indent=2), encoding="utf-8"
)

if result.returncode != 0:
    raise SystemExit(
        "Operation failed. Inspect artifacts/operation-results.json"
    )

layer = {
    "name": "CI Execution Evidence",
    "versions": {"attack": "17", "navigator": "5.2.0", "layer": "4.5"},
    "domain": "enterprise-attack",
    "description": "Executed technique evidence only; detection is not verified.",
    "techniques": [{
        "techniqueID": "T1082",
        "score": 1,
        "comment": "System information command completed; detection not verified."
    }],
    "gradient": {
        "colors": ["#ffffff", "#ff6666"],
        "minValue": 0,
        "maxValue": 1
    },
    "legendItems": [{
        "label": "Executed; detection not verified",
        "color": "#ff6666"
    }]
}

(OUT / "attack-navigator-layer.json").write_text(
    json.dumps(layer, indent=2), encoding="utf-8"
)

print("Operation results and Navigator layer created.")
