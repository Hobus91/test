resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'FG Weed'

version '1.0.0'

client_scripts {
  '@es_extended/config.lua',
  'config.lua',
  'client/main.lua'
}

server_scripts {
  '@es_extended/config.lua',
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}