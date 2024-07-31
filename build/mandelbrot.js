export async function instantiate(module, imports = {}) {
  const adaptedImports = {
    env: Object.assign(Object.create(globalThis), imports.env || {}, {
      "Math.log"(x) {
        // ~lib/bindings/dom/Math.log(f64) => f64
        return Math.log(x);
      },
      "Math.log2"(x) {
        // ~lib/bindings/dom/Math.log2(f64) => f64
        return Math.log2(x);
      },
    }),
  };
  const { exports } = await WebAssembly.instantiate(module, adaptedImports);
  return exports;
}
