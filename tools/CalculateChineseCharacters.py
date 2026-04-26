import sys
import re

def count_chinese_chars(filepath):
    """计算文件中的中文字符数量"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except UnicodeDecodeError:
        # 尝试其他编码
        with open(filepath, 'r', encoding='gbk') as f:
            content = f.read()
    
    # 匹配中文字符（基本汉字 + 扩展区）
    chinese_pattern = re.compile(r'[\u4e00-\u9fff\u3400-\u4dbf\u20000-\u2a6df\u2a700-\u2b73f\u2b740-\u2b81f\u2b820-\u2ceaf\uf900-\ufaff\u2f800-\u2fa1f]')
    chinese_chars = chinese_pattern.findall(content)
    
    return len(chinese_chars), chinese_chars

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("用法: python CalculateChineseCharacters.py <文件路径>")
        sys.exit(1)
    
    filepath = sys.argv[1]
    count, chars = count_chinese_chars(filepath)
    print(f"文件: {filepath}")
    print(f"中文字符总数: {count}")