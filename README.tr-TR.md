<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Nudge Logosu">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Nudge (<code>.ndg</code>) uygulamaları için tek tıkla yükleyici, başlatıcı ve masaüstü entegratörü.</strong><br>
  Nudge ajanlarını ve arayüzlü uygulamalarını Linux masaüstünüze yerel olarak bağlar.
</p>

<p align="center">
  <img alt="Platform Linux" src="https://img.shields.io/badge/Linux-Destekleniyor-success?logo=linux&logoColor=white">
  <img alt="Platform Windows" src="https://img.shields.io/badge/Windows-Yak%C4%B1nda-inactive?logo=windows&logoColor=white">
  <img alt="Platform macOS" src="https://img.shields.io/badge/macOS-Yak%C4%B1nda-inactive?logo=apple&logoColor=white">
  <img alt="Lisans" src="https://img.shields.io/badge/lisans-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/dil-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <strong>Türkçe</strong>
</p>

---

> **Bilgilendirme:** Şu anda **Linux** masaüstü ortamları (KDE Plasma, GNOME, XFCE; Debian, Ubuntu, Fedora, Arch, openSUSE vb.) tam olarak desteklenmektedir. **Windows** ve **macOS** entegrasyonları aktif geliştirme aşamasındadır ve çok yakında gelecektir.

## Neden Nudge App Runner?

Yapay zeka ajanlarını ve Nudge uygulamalarını çalıştırmak, arka planda kaybolan izole komut dosyaları çalıştırmak gibi hissettirmemelidir. Linux'ta gerçek bir yazılım nasıl kurulup çalıştırılıyorsa tam olarak öyle hissettirmelidir:

- **Gerçek Masaüstü Entegrasyonu:** Dosya yöneticinizde (Dolphin, Nautilus, Thunar vb.) herhangi bir `.ndg` dosyasına çift tıklayarak uygulamanın meta verilerini ve yetkilerini görebilir, tek tıkla sisteme kurabilirsiniz.
- **Uygulama Menüsü Erişimi:** Kurulan `.ndg` uygulamaları doğrudan Başlat Menünüze (KDE Kickoff, GNOME Dash, Rofi vb.) yerleşir; simgesiyle aranabilir, dock'a veya görev çubuğuna sabitlenebilir.
- **Gizli Arka Plan Süreçlerine Son:**
  - **Grafik Arayüzlü (GUI) Uygulamalar:** Doğrudan kendi yerel Wayland / X11 penceresiyle açılır.
  - **Terminal / Ajan Uygulamaları:** Asla arka planda gizlice çalışıp kaybolmaz! Canlı token akışını ve çıktıları gösteren görünür bir terminal penceresinde açılır; işlem bittiğinde sonuçları inceleyebilmeniz için açık kalır.
- **Yetki Şeffaflığı:** Uygulamayı kurmadan önce kullandığı Nudge efektlerini (`uses LLM`, `uses Tool`, `uses IO`, `uses Net`) inceleyebilirsiniz.

---

## Platform Desteği

| İşletim Sistemi | Durum | Paket Formatları | Masaüstü Ortamları |
| :--- | :---: | :--- | :--- |
| **Linux** | **Kullanıma Hazır** | `.deb`, `.run`, `.tar.gz`, `.zip` | KDE Plasma, GNOME, XFCE, Cinnamon, MATE, Cosmic |
| **Windows** | *Yakında* | `.msi`, `.exe` wrapper | Windows 10 / 11 Shell |
| **macOS** | *Yakında* | `.dmg`, `.app` paketi | macOS Finder / Launchpad |

---

## Kurulum (Linux)

### Yöntem 1: Debian / Ubuntu / Linux Mint / Pop!_OS (`.deb`)

[Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) sayfasından resmi `.deb` paketini indirin, çift tıklayarak kurun veya terminalden çalıştırın:

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### Yöntem 2: Evrensel Linux Kurulumcusu (`.run`)

**Fedora, Arch Linux, openSUSE, Gentoo, Void** ve diğer tüm dağıtımlarda tek tıkla çalışır:

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

### Yöntem 3: Taşınabilir Arşiv (`.tar.gz`)

1. `nudge-app-runner-1.2.1-linux.tar.gz` arşivini çıkartın.
2. Klasör içindeki `Install Nudge App Runner.desktop` dosyasına çift tıklayın (veya `./install.sh` çalıştırın).

---

## Nasıl Çalışır?

```
                     .ndg Dosyasına Çift Tıklayın
                                │
                                ▼
                    ┌────────────────────────┐
                    │   nudge-app-installer  │  (Grafik Arayüz)
                    │  Başlık ve Yetki İncele│
                    └───────────┬────────────┘
                                │
               ┌────────────────┴────────────────┐
               ▼                                 ▼
       [ Sisteme Kur ]                   [ Hemen Çalıştır ]
               │                                 │
     .desktop Başlatıcısı,                       │
     Simgeler ve Paket Kaydedilir                ▼
               │                          nudge-runner
               ▼                                 │
    KDE / GNOME Menüsünde                        ├─► Arayüzlü Uygulama ──► Yerel GUI Penceresi
    Hemen Görünür ve Aranabilir                  └─► Terminal Ajanı    ──► Canlı Terminal Penceresi
```

### 1. Dosya İlişkilendirmesi ve Analiz
Bir `.ndg` dosyası açıldığında modern koyu temalı bir arayüz karşılar:
- Uygulama adı, sürümü, açıklaması ve simgesi
- Uygulama türü: Grafik Arayüz (GUI) veya Terminal Ajanı (CLI)
- Bildirilen efekt rozetleri (LLM, IO, Tool, Network, UI)
- Kurulum durumu

### 2. Tek Tıkla Kurulum
**Sisteme Kur** tıklandığında:
- Uygulama paketi `~/.local/share/nudge/apps/<uygulama-id>/` altına yerleştirilir.
- `~/.local/bin/<uygulama-id>` altında çalıştırılabilir komut oluşturulur.
- `~/.local/share/applications/<uygulama-id>.desktop` dosyası oluşturulur.
- FreeDesktop veritabanı güncellenir ve uygulama sistem menünüzde **anında** belirir.

### 3. Temiz Kaldırma
Zaten kurulu olan bir `.ndg` dosyasını açtığınızda **Sistemden Kaldır** seçeneği sunulur. Tek tıkla kısayollar, simgeler ve dosyalar arkada artık bırakmadan temizlenir.

---

## Komut Satırı (CLI) Kullanımı

Terminalden hızlı işlemler ve betikler için:

```bash
# Bir uygulamanın grafik yükleyicisini aç
nudge-app-installer uygulama.ndg

# Grafik penceresi açmadan doğrudan kur
nudge-app-installer --install uygulama.ndg

# Kurulu tüm Nudge uygulamalarını listele
nudge-app-installer --list

# Uygulamayı sistemden kaldır
nudge-app-installer --uninstall uygulama-id

# Akıllı çalıştırıcı ile doğrudan başlat
nudge-runner uygulama.ndg --exec
```

---

## Kaynak Koddan İnşa Etme

```bash
git clone https://github.com/NekomyaDev/nudge-app-runner.git
cd nudge-app-runner

# Geliştirme için yerel sisteme kur:
./install.sh

# Tüm dağıtım paketlerini (.deb, .run, .tar.gz) üret:
./package.sh
```

---

## Lisans

[Apache License, Sürüm 2.0](LICENSE) ile lisanslanmıştır. [Nudge Programlama Dili Ekosistemi](https://github.com/NekomyaDev/nudge)'nin bir parçasıdır.
