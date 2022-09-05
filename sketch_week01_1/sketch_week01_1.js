function setup() {
    initializeFields();
    createCanvas(500, 500);
}
function draw() {
    background(color(0xF4, 0xFF, 0x83));
    fill(color(0x4D, 0xB9, 0xFF));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}
function initializeFields() {
}
