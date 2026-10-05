SERAY PINAR WEBSITE — FINAL PACKAGE (04 OCT 2026)

Bu paket GitHub repo yapisina hazirdir.
Repo: tajoxy/seray-pinar-website
Cloudflare Pages: GitHub main branch'e bagli.

YAPILANLAR
- Warsaw / Teatr Wielki — Polish National Opera: Roméo et Juliette — Stéphano eklendi.
- 6 temsil tarihi eklendi: 2, 4, 11, 17, 24 Ekim ve 8 Kasim 2026.
- Performed Roles bolumune Warsaw Stéphano eklendi.
- Studied/In Preparation listesindeki Stéphano kaldirildi.
- EN / FR / DE / IT / TR sayfalari guncellendi.
- Legal Notice / Mentions légales sayfalari 5 dilde eklendi.
- Privacy Policy sayfalari 5 dilde eklendi.
- Cookie Policy sayfalari 5 dilde eklendi.
- Footer'a Legal / Privacy / Cookies / Cookie Settings eklendi.
- Google Analytics artik kullanici onayi OLMADAN yuklenmiyor.
- Accept / Reject ayni seviyede sunuluyor.
- Tercih 6 ay localStorage'da saklaniyor.
- Google Analytics cookie omru yaklasik 13 ayla sinirlandi ve her pageview'da yenilenmiyor.
- Cookie Settings ile onay sonradan degistirilebiliyor.
- Cloudflare Pages icin temel guvenlik header'lari (_headers) eklendi.
- sitemap lastmod 2026-10-04.
- Dil klasorlerindeki favicon yolu duzeltildi.

GITHUB'A HAZIRLAMA
1) Bu ZIP'i bir klasore cikart.
2) PowerShell'i o klasorde ac.
3) Gerekirse yalnizca bu PowerShell oturumu icin:
   Set-ExecutionPolicy -Scope Process Bypass
4) Calistir:
   .\prepare-seray-github.ps1

Script:
- mevcut GitHub main branch'i temiz bir klasore clone eder,
- final site dosyalarini onun ustune koyar,
- git add -A yapar,
- sana GitHub'a gidecek farklari gosterir,
- AMA push yapmaz.

Son kontrol sonrasi:
cd .\seray-pinar-github-ready
git commit -m "Update Warsaw performances and add legal/privacy/cookie consent"
git push origin main

Cloudflare GitHub'a bagli oldugu icin push sonrasi otomatik deploy olur.

CANLIYA CIKTIKTAN SONRA KONTROL
- Gizli/Incognito pencerede mezzoseraypinar.com ac.
- Cookie banner gorunmeli.
- Reject Analytics: site calismaya devam etmeli ve _ga cookie olusmamali.
- Cookie Settings > Analytics ac > Save: GA yuklenmeli.
- Footer'daki legal/privacy/cookie linkleri acilmali.
- Warsaw kartinda 6 tarih ve Production details linki gorunmeli.
- /fr/, /de/, /it/, /tr/ sayfalari ayni sekilde calismali.

NOT
Mentions légales sayfasinda Fransa'daki şahis isletmesi icin kayitli profesyonel iletisim bilgileri kullanilmistir. Adres bir konut adresiyse ve bunu kamuya acik gostermek istemiyorsaniz, yayina almadan once profesyonel domiciliation adresi kullanmak gerekir.
