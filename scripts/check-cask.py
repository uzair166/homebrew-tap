#!/usr/bin/env python3
"""Check the parsed cask's uninstall boundary without deleting user data."""
import json
import subprocess
import sys

cask = json.loads(subprocess.check_output(
    ['brew', 'info', '--json=v2', '--cask', sys.argv[1]], text=True))['casks'][0]
artifacts = cask['artifacts']
zap = [entry for artifact in artifacts for entry in artifact.get('zap', [])]
assert len(zap) == 1, 'Complete cleanup must be explicitly defined'
assert set(zap[0]) == {'trash'}, 'Cleanup must use recoverable Trash, not deletion scripts'
assert set(zap[0]['trash']) == {
    '~/Library/Application Support/Limitwen',
    '~/Library/Preferences/app.limitwen.mac.plist',
}, 'Cleanup must remain limited to Limitwen-owned data, never provider configuration'
uninstall = [entry for artifact in artifacts for entry in artifact.get('uninstall', [])]
assert uninstall == [{'quit': 'app.limitwen.mac'}], 'Normal uninstall must preserve preferences'
print('PASS: normal uninstall preserves data; zap targets only Limitwen-owned data')
