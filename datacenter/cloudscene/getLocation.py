import os
import json
import time
import requests
import platform

# 根路径（请根据你的项目结构修改）
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_DIR = os.path.join(BASE_DIR, "data")
LOCATION_DIR = os.path.join(BASE_DIR, "location")

# 若不存在 location 目录，则创建
os.makedirs(LOCATION_DIR, exist_ok=True)

def beep():
    """跨平台发出警报声音"""
    if platform.system() == "Windows":
        import winsound
        winsound.Beep(1000, 500)
    else:
        print("\a")  # macOS/Linux 使用终端提示音

def fetch_location_data(facility_id):
    """请求接口并返回 JSON 数据"""
    url = f"https://cloudscene.com/api/directory-service/assets/facilities/{facility_id}/location"
    try:
        resp = requests.get(url, timeout=15)
        resp.raise_for_status()
        return resp.json()
    except Exception as e:
        print(f"❌ 请求出错: {e}")
        beep()
        return None

def process_state(state_dir, stats):
    """处理单个州目录"""
    state_name = os.path.basename(state_dir)
    print(f"\n📂 正在处理州: {state_name}")

    # 对应的 location 州目录
    state_location_dir = os.path.join(LOCATION_DIR, state_name)
    os.makedirs(state_location_dir, exist_ok=True)

    for filename in os.listdir(state_dir):
        if not filename.endswith(".json"):
            continue

        input_path = os.path.join(state_dir, filename)
        output_path = os.path.join(state_location_dir, filename)

        # 已存在文件则跳过
        if os.path.exists(output_path):
            print(f"✅ 已存在，跳过: {output_path}")
            stats["existing"] += 1
            continue

        # 尝试读取 pageProps.id
        try:
            with open(input_path, "r", encoding="utf-8") as f:
                data = json.load(f)
            facility_id = data["pageProps"]["id"]
        except Exception as e:
            print(f"⚠️ 无法读取 ID ({filename})：{e}，跳过。")
            stats["invalid_id"] += 1
            continue  # 不等待

        print(f"➡️ 请求 ID: {facility_id}")

        # 请求接口
        result = fetch_location_data(facility_id)
        if result:
            with open(output_path, "w", encoding="utf-8") as f:
                json.dump(result, f, ensure_ascii=False, indent=2)
            print(f"💾 已保存: {output_path}")
            stats["success"] += 1
        else:
            print(f"⚠️ 请求失败，跳过: {filename}")
            stats["failed"] += 1

        # 无论成功或失败都等待 30 秒（读取 ID 失败则不等待）
        print("⏳ 等待 30 秒后继续下一个...")
        time.sleep(30)

def main():
    stats = {
        "success": 0,
        "failed": 0,
        "invalid_id": 0,
        "existing": 0,
    }

    for state in os.listdir(DATA_DIR):
        state_path = os.path.join(DATA_DIR, state)
        if os.path.isdir(state_path):
            process_state(state_path, stats)

    # --- 运行结束统计 ---
    total_skipped = stats["invalid_id"] + stats["existing"]
    print("\n==========================")
    print("🏁 运行结束统计：")
    print(f"✅ 成功保存文件数: {stats['success']}")
    print(f"❌ 请求失败文件数: {stats['failed']}")
    print(f"⚠️ 无效 ID（跳过）: {stats['invalid_id']}")
    print(f"📂 已存在文件（跳过）: {stats['existing']}")
    print(f"🚫 总跳过文件数: {total_skipped}")
    print("==========================")

if __name__ == "__main__":
    main()
