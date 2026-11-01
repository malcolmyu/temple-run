"""Export the reference result's crocodile illustration from the base APK."""
import sys,zipfile
from pathlib import Path
import UnityPy
z=zipfile.ZipFile(sys.argv[1]);parts=sorted((n for n in z.namelist()if '/sharedassets0.assets.split'in n),key=lambda n:int(n.rsplit('split',1)[1]));env=UnityPy.load(b''.join(z.read(n)for n in parts))
art=next(o.read()for o in env.objects if o.type.name=='Texture2D' and o.read().m_Name=='deathIllustrationWater@2x')
out=Path(__file__).resolve().parents[1]/'target/temple-run/web/public/assets/ui/deathIllustrationWater@2x.png';art.image.save(out);print(out)
