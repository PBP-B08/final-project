# Cultural Center
[![Build status](https://build.appcenter.ms/v0.1/apps/d55c1cb6-2d8b-4405-9284-9263e63baa56/branches/main/badge)](https://appcenter.ms)

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

## Link Aplikasi

Proyek ini dapat diunduh di [https://install.appcenter.ms/orgs/pbp-b08-2022/apps/cultural-center/distribution_groups/public](https://install.appcenter.ms/orgs/pbp-b08-2022/apps/cultural-center/distribution_groups/public)

## Pengembang Aplikasi

Proyek ini dibuat oleh kelompok B08 yang beranggotakan sebagai berikut.

- [Muhammad Tarreq Maulana](https://github.com/mrtrq) (2106750704)
- [Muhammad Vicky Maulana](https://github.com/electyrion) (2106750906)
- [Naila Shafirni Hidayat](https://github.com/nailashfrni) (2106638324)
- [Achmad Noval Fahrezi](https://github.com/novalzfahr) (2106750931)
- [Natanael Pascal Simbolon](https://github.com/V1ct0riaa) (2106751764)
- [Gabriel Edgar Firdausyah N](https://github.com/nois44) (2106752312)

## Deskripsi Singkat

Cultural Center merupakan aplikasi yang menjadi sarana mempromosikan kebudayaan daerah-daerah di Indonesia. Aplikasi ini akan menyajikan informasi seputar destinasi wisata, profil daerah, kuliner khas daerah, tradisi dan adat istiadat. Aplikasi ini bermanfaat untuk membantu wisatawan merencanakan kegiatan wisata mereka, meningkatkan daya tarik wisatawan lokal maupun internasional, membantu sektor pariwisata dalam negeri, dan menaikan laju pertumbuhan ekonomi daerah setempat.

## Daftar modul

1. Sign up/sign in
   - Developer: [Muhammad Vicky Maulana](https://github.com/electyrion)
   - Deskripsi: Halaman untuk user melakukan sign up dan log in ke dalam aplikasi
   - Detail fitur:
      - Halaman login
      - Halaman register
2. Homepage
   - Developer: [Naila Shafirni Hidayat](https://github.com/nailashfrni)
   - Deskripsi: Halaman utama yang berisi menu fitur-fitur aplikasi
   - Detail fitur:
      - Landing Page
3. Event calendar
   - Developer: [Gabriel Edgar Firdausyah N](https://github.com/nois44)
   - Deskripsi: Halaman yang menampilkan event terdekat kebudayaan di Indonesia yang dikategorikan berdasarkan bulan.
   - Detail fitur:
      - Calendar upcoming event
4. Recommendation
   - Developer: [Natanael Pascal Simbolon](https://github.com/V1ct0riaa) (Culture highlight), [Muhammad Vicky Maulana](https://github.com/electyrion) (Deskripsi & Places to go)
   - Deskripsi: Halaman yang menampilkan deskripsi umum mengenai provinsi, rekomendasi tempat untuk destinasi wisata, serta highlight kebudayaan khas daerah.
   - Detail fitur:
      - Deskripsi
      - Places to go
      - Culture highlight
5. Things to do
   - Developer: [Naila Shafirni Hidayat](https://github.com/nailashfrni)
   - Deskripsi: Halaman yang menampilkan informasi mengenai rekomendasi makanan populer dan event atau perayaan tahunan khas daerah.
   - Detail fitur:
      - Food
      - Events
6. FAQ dan Review
   - Developer: [Achmad Noval Fahrezi](https://github.com/novalzfahr)
   - Deskripsi: Halaman yang menampilkan pertanyaan-pertanyaan yang sering diajukan mengenai suatu daerah, serta ulasan pengguna yang pernah mengunjungi daerah tersebut
   - Detail fitur:
      - Daftar FAQ
      - Daftar review pengguna
      - Form review
7. Plan Your Trip
   - Developer: [Muhammad Tarreq Maulana](https://github.com/mrtrq)
   - Deskripsi: Halaman yang menampilkan paket-paket wisata untuk mempermudah wisatawan dalam merencanakan wisata mereka ke suatu daerah.
   - Detail fitur:
      - Paket wisata

## Role

### User Yang Tidak Login / Visitor

- Mengunjungi Home page
- Mengunjungi sign up/sign in/register page
- Melihat event calendar
- Mengunjungi detail recommendation dan things to do pada setiap halaman daerah

### User Login

- Membuat review baru pada halaman daerah
- Menambah data makanan dan event baru pada halaman Things to Do
- Mengakses semua modul dari user yang tidak login
- Mengunjungi halaman dashboard profil dan memodifikasi profil
- Mengakses halaman Plan Your Trip

## Alur Integrasi Web

1. Menginstall dependency http agar dapat mengirim request HTTP ke internet
2. Membuat model yang sesuai dengan struktur data JSON yang didapat dari endpoint di Railway
3. Membuat fungsi yang dapat melakukan fetch data atau mengirim request HTTP pada endpoint JSON
4. Melakukan konversi object yang telah didapat dari web service menjadi model yang telah dibuat sebelumnya pada tahap kedua
5. Memproses data yang telah dikonversi dengan FutureBuilder sehingga data dapat ditampilkan di aplikasi Flutter
