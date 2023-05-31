//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <amplify_db_common/amplify_db_common_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) amplify_db_common_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AmplifyDbCommonPlugin");
  amplify_db_common_plugin_register_with_registrar(amplify_db_common_registrar);
}
