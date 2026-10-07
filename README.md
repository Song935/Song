# Song의 VS Code 설정

제가 쓰는 VS Code 설정과 확장 목록입니다. 자유롭게 가져다 쓰세요.

## 들어 있는 것

| 파일 | 내용 |
|---|---|
| `settings.json` | 사용자 설정 (테마 Dark+, Claude Code 패널 배치 등) |
| `extensions.txt` | 설치한 확장 ID 목록 |
| `install.ps1` | 확장 설치 + 설정 복사 스크립트 (Windows) |

## 주요 확장

- **AI:** Claude Code
- **Python:** Python, Pylance, Debugpy
- **C# / .NET:** C# Dev Kit, C#, .NET Runtime
- **웹:** ESLint, Prettier, Live Server
- **Git:** GitLens, GitHub Pull Requests
- **마크다운·문서:** Markdown All in One, Office Viewer, Markdown Fragment Variable Preview
- **기타:** Error Lens, Fortran, 한국어 언어 팩

## 적용 방법 (Windows)

```powershell
git clone https://github.com/Song935/Song.git
cd Song
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

- 기존 `settings.json`은 `settings.json.bak`으로 백업한 뒤 덮어씁니다.
- 확장만 설치하려면:
  ```powershell
  Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
  ```
- macOS/Linux에서는 설정 위치가 다릅니다 (`~/Library/Application Support/Code/User/`, `~/.config/Code/User/`). `settings.json`을 직접 복사하세요.
