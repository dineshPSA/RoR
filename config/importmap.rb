# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
# pin "social-share-button", to: "https://ga.jspm.io/npm:social-share-button@2.2.0/index.js"
# pin "attrobj", to: "https://ga.jspm.io/npm:attrobj@3.1.0/lib/attrobj.js"
# pin "aug", to: "https://ga.jspm.io/npm:aug@4.0.0/dist/aug.js"
# pin "domassist", to: "https://ga.jspm.io/npm:domassist@2.3.1/domassist.js"
# pin "domodule", to: "https://ga.jspm.io/npm:domodule@8.1.0/lib/domodule.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.2.0/js/fontawesome.js"
pin "@fortawesome/fontawesome-svg-core", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.2.0/index.mjs"
pin "@fortawesome/free-brands-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.2.0/index.mjs"
pin "@fortawesome/free-regular-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-regular-svg-icons@6.2.0/index.mjs"
pin "@fortawesome/free-solid-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-solid-svg-icons@6.2.0/index.mjs"
