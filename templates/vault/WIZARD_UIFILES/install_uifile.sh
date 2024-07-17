#!/bin/sh

SYNOLOGY_IP=$(ip route get "$(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+')" | grep -oP 'src \K\S+')

tee "$SYNOPKG_TEMP_LOGFILE" <<EOF
[
  {
    "step_title": "Vault Configuration",
    "items": [
      {
        "type": "textfield",
        "desc": "Vault Web UI URL",
        "subitems": [
          {
            "key": "pkgwizard_vault_web_ui_url",
            "defaultValue": "http://$SYNOLOGY_IP:8200"
          }
        ]
      }
    ]
  }
];
EOF

exit 0
