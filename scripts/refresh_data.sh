#!/bin/bash
# Data synchronization and SVG generation script

set -e  # Exit immediately if a command exits with a non-zero status

echo "🚴 开始数据同步流程..."
echo "=========================================="

# 1. Sync GPX data
echo ""
echo "📁 Step 1/3: 同步 GPX 数据..."
python3 run_page/gpx_sync.py
echo "✅ GPX 数据同步完成"

# 2. Generate GitHub SVG
echo ""
echo "🎨 Step 2/3: 生成 GitHub SVG..."
python3 run_page/gen_svg.py \
  --from-db \
  --title "Sawyer" \
  --type github \
  --athlete "Sawyer" \
  --special-distance 10 \
  --special-distance2 20 \
  --special-color yellow \
  --special-color2 red \
  --output assets/github.svg \
  --use-localtime \
  --min-distance 0.5
echo "✅ GitHub SVG 生成完成"

# 3. Generate Grid SVG
echo ""
echo "🎨 Step 3/3: 生成 Grid SVG..."
python3 run_page/gen_svg.py \
  --from-db \
  --title "Over 10KM Rides" \
  --type grid \
  --athlete "Sawyer" \
  --output assets/grid.svg \
  --min-distance 10.0 \
  --special-color yellow \
  --special-color2 red \
  --special-distance 20 \
  --special-distance2 40 \
  --use-localtime
echo "✅ Grid SVG 生成完成"

echo ""
echo "=========================================="
echo "🎉 所有任务完成！"
echo "📊 数据已更新到: src/static/activities.json"
echo "🎨 SVG 已生成到: assets/"