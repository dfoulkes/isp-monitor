{
  _config+:: {
    namespace: 'speed-tester',
  },
  // Enable or disable additional modules
  modules: [
    {
      name: 'speedtestExporter',
      enabled: true,
      file: import 'modules/speedtest_exporter.jsonnet',
    }
  ],

  k3s: {
    enabled: true,
    master_ip: ['master_ip'],
  },

  // Domain suffix for the ingresses
  suffixDomain: '<master_ip>.nip.io',
  // Additional domain suffixes for the ingresses.
  // For example suffixDomain could be an external one and this a local domain.
  additionalDomains: [],
  // If TLSingress is true, a self-signed HTTPS ingress with redirect will be created
  TLSingress: true,
  // If UseProvidedCerts is true, provided files will be used on created HTTPS ingresses.
  // Use a wildcard certificate for the domain like ex. "*.192.168.99.100.nip.io"
  UseProvidedCerts: false,
  TLSCertificate: importstr 'server.crt',
  TLSKey: importstr 'server.key',

  // Persistent volume configuration
  enablePersistence: {
    // Setting these to false, defaults to emptyDirs.
    prometheus: true,
    grafana: false,
    // If using a pre-created PV, fill in the names below. If blank, they will use the default StorageClass
    prometheusPV: '',
    grafanaPV: '',
    //prometheusPV: '',
    //grafanaPV: '',
    // If required to use a specific storageClass, keep the PV names above blank and fill the storageClass name below.
    storageClass: 'longhorn',
    // Define the PV sizes below
    prometheusSizePV: '8Gi',
    grafanaSizePV: '8Gi',
  },

  // Configuration for Prometheus deployment
  prometheus: {
    retention: '365d',
    scrapeInterval: '1800s',
    scrapeTimeout: '30s',
  },
  grafana: {
    // Grafana "from" email
    from_address: '',
    root_url: 'http://speed-grafana.<master_ip>.nip.io',
    // Plugins to be installed at runtime.
    //Ex. plugins: ['grafana-piechart-panel', 'grafana-clock-panel'],
    plugins: ['grafana-piechart-panel', 'grafana-clock-panel'],
    //Ex. env: [ { name: 'http_proxy', value: 'host:8080' } ]
    env: []
  },
}
