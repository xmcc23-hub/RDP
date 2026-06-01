# Flappy Bird Clone - Godot 4.6

Sebuah game Flappy Bird clone yang dibuat menggunakan Godot 4.6 dengan fitur lengkap.

## Fitur

✅ **Gameplay Dasar**
- Bird yang jatuh karena gravity
- Kontrol dengan spacebar atau click
- Pipe obstacles yang bergerak
- Collision detection

✅ **Sistem Skor**
- Skor real-time saat bermain
- High score tracking
- Simpan high score ke file config

✅ **Efek Suara**
- Background music
- Sound effect untuk jump
- Sound effect untuk score
- Sound effect untuk collision

✅ **Kesulitan Berbeda**
- Easy: Gap lebih lebar, pipe lebih lambat
- Normal: Balance antara mudah dan sulit
- Hard: Gap lebih sempit, pipe lebih cepat

✅ **Menu & UI**
- Main menu dengan pemilihan difficulty
- Game over screen dengan score recap
- High score display

## Struktur Folder

```
flappy_bird_godot/
├── scenes/
│   ├── main.tscn              # Main scene
│   ├── game_manager.gd        # Game logic
│   ├── bird/
│   │   ├── bird.tscn
│   │   └── bird.gd
│   ├── pipes/
│   │   ├── pipe.tscn
│   │   ├── pipe.gd
│   │   └── pipe_spawner.gd
│   ├── ui/
│   │   ├── ui.tscn
│   │   └── ui_manager.gd
│   └── audio/
│       ├── audio_manager.gd
│       └── sounds/ (audio files)
├── assets/
│   ├── bird.png
│   ├── pipe.png
│   └── icon.png
├── project.godot
└── README.md
```

## Cara Bermain

1. Jalankan game
2. Pilih tingkat kesulitan (Easy, Normal, Hard)
3. Tekan SPACE atau klik untuk memulai
4. Tekan SPACE untuk membuat bird terbang
5. Hindari pipe yang bergerak
6. Setiap pipe yang terlewati menambah score
7. Game berakhir saat bird menabrak pipe atau jatuh

## Input Controls

- **SPACE / CLICK**: Flap (terbang) / Start Game / Restart
- **ESC**: Kembali ke menu (saat game over)

## Pengembangan

Untuk menambah fitur lebih lanjut:
- Tambah power-ups
- Leaderboard online
- Berbagai skin bird
- Animasi yang lebih halus
- Efek partikel

## Requirements

- Godot 4.6
- GDScript

## Lisensi

Free to use and modify for educational purposes.