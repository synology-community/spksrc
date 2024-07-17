#!/bin/sh

SYNOLOGY_IP=$(ip route get "$(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+')" | grep -oP 'src \K\S+')

tee "$SYNOPKG_TEMP_LOGFILE" <<EOF
[
  {
    "step_title": "Consul Configuration",
    "items": [
      {
        "type": "textfield",
        "desc": "Consul Web UI URL",
        "subitems": [
          {
            "key": "pkgwizard_consul_web_ui_url",
            "defaultValue": "http://$SYNOLOGY_IP:8500"
          }
        ]
      }
    ]
  }
];
EOF

exit 0
