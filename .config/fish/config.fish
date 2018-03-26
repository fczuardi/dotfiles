fish_vi_key_bindings

fundle plugin 'edc/bass'
fundle init

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm use --delete-prefix v9.9.0
end

