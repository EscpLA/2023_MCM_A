# 这是一个示例 Python 脚本。

# 按 Shift+F10 执行或将其替换为您的代码。
# 按 双击 Shift 在所有地方搜索类、文件、工具窗口、操作和设置。

import folium
def print_hi(name):
    # 在下面的代码行中使用断点来调试脚本。
    print(f'Hi, {name}')  # 按 Ctrl+F8 切换断点。


# 按间距中的绿色按钮以运行脚本。
if __name__ == '__main__':
    # define the national map
    national_map = folium.Map(location=[50, 121],tiles='http://map.geoq.cn/ArcGIS/rest/services/ChinaOnlineStreetWarm/MapServer/tile/{z}/{y}/{x}',
               attr='暖色版',
               zoom_start=5)
    # save national map
    national_map.save('test_03.html')

# 访问 https://www.jetbrains.com/help/pycharm/ 获取 PyCharm 帮助
