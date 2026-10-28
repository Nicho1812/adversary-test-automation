import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ARTIFACTS = ROOT / "artifacts"


def test_operation_results_record_successful_execution():
    result = json.loads(
        (ARTIFACTS / "operation-results.json").read_text(encoding="utf-8")
    )
    assert result["technique_id"] == "T1082"
    assert result["executed"] is True
    assert result["execution_passed"] is True
    assert result["exit_code"] == 0
    assert result["stdout"].strip()
    assert result["detection_verified"] is False


def test_navigator_layer_matches_executed_technique():
    layer = json.loads(
        (ARTIFACTS / "attack-navigator-layer.json").read_text(encoding="utf-8")
    )
    assert layer["domain"] == "enterprise-attack"
    assert any(t["techniqueID"] == "T1082" for t in layer["techniques"])
    assert "detection is not verified" in layer["description"].lower()
