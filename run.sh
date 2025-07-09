#!/bin/bash

# Ensure you're inside the repo root
echo "📁 Working directory: $(pwd)"

# Create folders
mkdir -p resume download assets

# Create resume page to view PDF
cat <<EOF > resume/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Online Resume - Abhay Ranjan Samal</title>
</head>
<body>
  <h1>My Resume</h1>
  <iframe src="/assets/abhay_resume.pdf" width="100%" height="800px" style="border:none;">
    Your browser does not support PDF embedding. <a href="/assets/abhay_resume.pdf">Download PDF</a>
  </iframe>
</body>
</html>
EOF

# Create download page to trigger download
cat <<EOF > download/index.html
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="refresh" content="0;url=/assets/abhay_resume.pdf" />
  <title>Downloading Resume</title>
</head>
<body>
  <p>Redirecting to download resume...</p>
</body>
</html>
EOF

# Check if PDF exists in current folder
if [ -f "abhay_resume.pdf" ]; then
  cp abhay_resume.pdf assets/abhay_resume.pdf
  echo "✅ Resume PDF copied to assets/"
else
  echo "⚠️  abhay_resume.pdf not found. Please place your PDF in this directory before running the script."
fi

echo "✅ Pages created: /resume, /download, /assets"
echo "🚀 Push changes using: git add . && git commit -m 'Add resume viewer and download pages' && git push"
