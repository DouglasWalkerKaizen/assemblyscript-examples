export async function instantiate(module, imports = {}) {
  const __module0 = imports["game-of-life"];
  const adaptedImports = {
    env: Object.assign(Object.create(globalThis), imports.env || {}, {
      "Math.random"() {
        // ~lib/bindings/dom/Math.random() => f64
        return Math.random();
      },
    }),
    "game-of-life": __module0,
  };
  const { exports } = await WebAssembly.instantiate(module, adaptedImports);
  return exports;
}
