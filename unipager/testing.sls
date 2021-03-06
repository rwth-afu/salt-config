unipager.repo:
  pkgrepo.managed:
    - humanname: unipager
    - file: /etc/apt/sources.list.d/unipager.list
    - refresh_db: true
    - clean_file: true
    - dist: unipager-testing
{% if grains['id'].endswith('ampr.org') %}
    - name: deb http://db0sda.ampr.org/debian unipager-testing main
    - key_url: http://db0sda.ampr.org/debian/rwth-afu.key
{% else %}
    - name: deb http://www.afu.rwth-aachen.de/debian unipager-testing main
    - key_url: https://www.afu.rwth-aachen.de/debian/rwth-afu.key
{% endif %}

unipager.package:
  pkg.installed:
    - pkgs:
      - unipager
    - refresh: True

unipager:
  service.running:
    - enable: True