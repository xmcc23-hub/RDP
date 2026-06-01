# Audio Files for Flappy Bird Game

Ku perlu file audio berikut. Silakan gunakan tools seperti:
- **bfxr** (untuk sound effects)
- **Audacity** (untuk editing)
- **FMOD Studio** (untuk professional audio)

## File yang Diperlukan:

### 1. background_music.ogg
- Loop music untuk background game
- Tempo: 140 BPM
- Durasi: 10-30 detik (akan diloop)
- Genre: Upbeat, playful
- Rekomendasi: Chiptune atau 8-bit style

### 2. flap.ogg
- Sound effect saat bird melompat
- Durasi: 0.1-0.2 detik
- Type: High-pitched beep
- Rekomendasi: 800Hz sine wave chirp

### 3. score.ogg
- Sound effect saat mendapatkan poin
- Durasi: 0.2-0.3 detik
- Type: Ascending tone
- Rekomendasi: 1000Hz to 1500Hz chirp

### 4. collision.ogg
- Sound effect saat collision/game over
- Durasi: 0.3-0.5 detik
- Type: Low-pitched descending tone
- Rekomendasi: 400Hz to 200Hz slide

## Cara Membuat dengan bfxr:

1. Download bfxr dari: https://www.bfxr.net/
2. Pilih preset yang sesuai
3. Customize parameter
4. Export sebagai .wav
5. Convert ke .ogg menggunakan FFmpeg:
   ```
   ffmpeg -i sound.wav sound.ogg
   ```

## Alternatif Free Resources:

- OpenGameArt.org
- Freesound.org
- Zapsplat.com
- Itch.io

Cari dengan keyword: "8-bit", "chiptune", "jump", "score", "game over"
