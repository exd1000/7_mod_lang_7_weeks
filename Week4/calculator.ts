export class Calculator {
  add(a: number, b: number) {return a+b}
  subtract(a: number, b: number) {return a-b}
  multiply(a: number, b: number) {return a*b}
  divide(a:number, b: number) {
    if (b === 0) throw new Error('Zero division');
    return a/b;
  }
}