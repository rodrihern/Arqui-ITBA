typedef struct Point {
    int x;
    int y;
} Point;

Point move(Point p);

int main() {
    Point p;
    p.x = 3;
    p.y = 6;
    Point moved = move(p);
}

Point move(Point p) {
    p.x++;
    p.y++;

    return p;
}