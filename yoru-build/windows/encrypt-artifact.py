"""Package the built executable and encrypt it to an age recipient."""

import argparse
import os
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZIP_DEFLATED, ZipFile

from pyrage import encrypt_file, x25519


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    recipient = x25519.Recipient.from_str(os.environ["YORU_RECIPIENT"])
    with TemporaryDirectory() as directory:
        archive = Path(directory) / "YoruGram-Windows-x64.zip"
        with ZipFile(archive, "w", ZIP_DEFLATED, compresslevel=3) as package:
            for filename in ("YoruGram.exe", "LICENSE", "LEGAL", "SHA256.txt"):
                package.write(args.package / filename, filename)
        encrypt_file(str(archive), str(args.output), [recipient])


if __name__ == "__main__":
    main()
