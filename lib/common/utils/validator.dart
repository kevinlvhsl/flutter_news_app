/// 验证邮箱格式
bool ukIsEmail(String val) {
  if (val == null || val.isEmpty) {
    return false;
  }
  String regEmail = '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$';
  return RegExp(regEmail).hasMatch(val);
}

/// 检查字符长度 够不够指定长度
bool ukCheckLength(String val, int len) {
  if (val == null || val.isEmpty) {
    return false;
  }
  return val.length >= len;
}
