declare namespace __AdaptedExports {
  /** Exported memory */
  export const memory: WebAssembly.Memory;
  /**
   * assembly/game-of-life/init
   * @param w `i32`
   * @param h `i32`
   */
  export function init(w: number, h: number): void;
  /**
   * assembly/game-of-life/step
   */
  export function step(): void;
  /**
   * assembly/game-of-life/fill
   * @param x `u32`
   * @param y `u32`
   * @param p `f64`
   */
  export function fill(x: number, y: number, p: number): void;
}
/** Instantiates the compiled WebAssembly module with the given imports. */
export declare function instantiate(module: WebAssembly.Module, imports: {
  env: unknown,
  "game-of-life": unknown,
}): Promise<typeof __AdaptedExports>;
