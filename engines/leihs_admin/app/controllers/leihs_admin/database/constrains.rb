# rubocop:disable Metrics/ModuleLength

module LeihsAdmin
  module Database
    module Constrains

      INDEXES = \
        [
          ['access_rights', ['deleted_at']],
          ['access_rights', ['inventory_pool_id']],
          ['access_rights', ['suspended_until']],
          ['access_rights', %w(user_id inventory_pool_id deleted_at)],
          ['accessories', ['model_id']],
          ['accessories_inventory_pools',
           ['accessory_id', 'inventory_pool_id'], unique: true],
          ['accessories_inventory_pools', ['inventory_pool_id']],
          ['addresses', %w(street zip_code city country_code), unique: true],
          ['attachments', ['model_id']],
          ['audits', ['auditable_id', 'auditable_type']],
          ['audits', ['associated_id', 'associated_type']],
          ['audits', ['user_id', 'user_type']],
          ['audits', ['request_uuid']],
          ['audits', ['created_at']],
          ['reservations', ['status']],
          ['reservations', ['inventory_pool_id']],
          ['reservations', ['user_id']],
          ['reservations', ['delegated_user_id']],
          ['reservations', ['handed_over_by_user_id']],
          ['reservations', ['contract_id']],
          ['reservations', ['end_date']],
          ['reservations', ['item_id']],
          ['reservations', ['model_id']],
          ['reservations', ['option_id']],
          ['reservations', ['returned_date', 'contract_id']],
          ['reservations', ['start_date']],
          ['reservations', ['type', 'contract_id']],
          ['groups', ['inventory_pool_id']],
          ['groups_users', ['group_id']],
          ['groups_users', ['user_id', 'group_id'], unique: true],
          ['holidays', ['inventory_pool_id']],
          ['holidays', ['start_date', 'end_date']],
          ['images', ['target_id', 'target_type']],
          ['inventory_pools', ['name'], unique: true],
          ['inventory_pools_model_groups', ['inventory_pool_id']],
          ['inventory_pools_model_groups', ['model_group_id']],
          ['items', ['inventory_code'], unique: true],
          ['items', ['inventory_pool_id']],
          ['items', ['is_borrowable']],
          ['items', ['is_broken']],
          ['items', ['is_incomplete']],
          ['items', ['location_id']],
          ['items', %w(model_id retired inventory_pool_id)],
          ['items', ['owner_id']],
          ['items', ['parent_id', 'retired']],
          ['items', ['retired']],
          ['languages', ['active', 'default']],
          ['languages', ['name'], unique: true],
          ['locations', ['building_id']],
          ['model_group_links', ['ancestor_id']],
          ['model_group_links', %w(descendant_id ancestor_id direct)],
          ['model_group_links', ['direct']],
          ['model_groups', ['type']],
          ['model_links', ['model_group_id', 'model_id']],
          ['model_links', ['model_id', 'model_group_id']],
          ['models', ['is_package']],
          ['models_compatibles', ['compatible_id']],
          ['models_compatibles', ['model_id']],
          ['notifications', ['user_id']],
          ['notifications', ['created_at', 'user_id']],
          ['options', ['inventory_pool_id']],
          ['partitions', %w(model_id inventory_pool_id group_id), unique: true],
          ['properties', ['model_id']],
          ['users', ['authentication_system_id']],
          ['workdays', ['inventory_pool_id']]
        ]

      NOT_NULL_COLUMNS = \
        [
          [:access_rights, :user_id],
          [:access_rights, :role],
          [:accessories, :name],
          [:buildings, :name],
          [:database_authentications, :login],
          [:database_authentications, :user_id],
          [:groups, :name],
          [:groups, :inventory_pool_id],
          [:inventory_pools, :name],
          [:inventory_pools, :shortname],
          [:inventory_pools, :email],
          [:accessories, :name],
          [:items, :inventory_code],
          [:items, :model_id],
          [:items, :owner_id],
          [:items, :inventory_pool_id],
          [:models, :product],
          [:model_groups, :name],
          [:model_links, :model_group_id],
          [:model_links, :model_id],
          [:model_links, :quantity],
          [:options, :inventory_pool_id],
          [:options, :product],
          [:partitions, :model_id],
          [:partitions, :inventory_pool_id],
          [:partitions, :group_id],
          [:partitions, :quantity],
          [:properties, :key],
          [:properties, :value],
          [:reservations, :user_id],
          [:reservations, :inventory_pool_id],
          [:reservations, :status],
          [:settings, :local_currency_string],
          [:settings, :email_signature],
          [:settings, :default_email],
          [:suppliers, :name],
          [:users, :firstname]
        ]

    end
  end
end

# rubocop:enable Metrics/ModuleLength
