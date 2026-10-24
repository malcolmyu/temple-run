#!/usr/bin/env python3
"""Regenerate the LAN QR code shown in the desktop side panel.

Usage:  python3 target/temple-run/tools/gen-lan-qr.py [port]
Requires: pip3 install qrcode pillow

It detects the primary LAN IPv4 address, writes web/public/assets/ui/qr-lan.png
and updates the URL text in web/index.html so the two stay in sync.
"""
import re
import socket
import sys
from pathlib import Path

import qrcode
from qrcode.constants import ERROR_CORRECT_M

ROOT = Path(__file__).resolve().parents[1]
PNG = ROOT / "web" / "public" / "assets" / "ui" / "qr-lan.png"
HTML = ROOT / "web" / "index.html"


def lan_ip() -> str:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # No packets are sent; this just asks the OS which interface would be used.
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
    except OSError:
        ip = "127.0.0.1"
    finally:
        s.close()
    return ip


def main() -> None:
    port = sys.argv[1] if len(sys.argv) > 1 else "5173"
    url = f"http://{lan_ip()}:{port}/"

    qr = qrcode.QRCode(error_correction=ERROR_CORRECT_M, box_size=16, border=2)
    qr.add_data(url)
    qr.make(fit=True)
    img = qr.make_image(fill_color=(26, 20, 8), back_color=(242, 230, 200)).convert("RGB")
    img.save(PNG)

    html = HTML.read_text(encoding="utf-8")
    html = re.sub(r'(<code id="qrUrl">)(.*?)(</code>)', lambda m: m.group(1) + url + m.group(3), html)
    HTML.write_text(html, encoding="utf-8")
    print(f"QR regenerated: {url} -> {PNG}")


if __name__ == "__main__":
    main()
