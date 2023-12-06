class RoleUserConstants {
  RoleUserConstants._();
  static List<String> listRoleDropdown = ['USER', 'FARMER', 'ASSOCIATIONS'];
  static List<String> listIsLockedDropdown = <String>[
    'Kích hoạt',
    'Không kích hoạt'
  ];
  static Map<String, String> roleLabels = {
    'USER': 'Người dùng',
    'FARMER': 'Chủ hội',
    'ASSOCIATIONS': 'Hiệp hội',
  };
}
