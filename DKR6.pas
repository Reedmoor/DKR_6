uses crt;
type
  QueueArray = array[1..100] of integer;
var
  Queue: QueueArray;
  Head, Tail: integer;

procedure Enqueue(Value: integer);
begin
  if Tail = 100 then
    Writeln('Queue overflow')
  else
  begin
    Inc(Tail);
    Queue[Tail] := Value;
  end;
end;

function Dequeue: integer;
begin
  if Head = Tail then
  begin
    Writeln('Queue underflow');
    Dequeue := 0;
  end
  else
  begin
    Inc(Head);
    Dequeue := Queue[Head];
  end;
end;

procedure PrintQueue;
var
  i: integer;
begin
  Writeln('Queue: ');
  for i := Head + 1 to Tail do
    Write(Queue[i], ' ');
  Writeln;
  Writeln;
end;

var
  Option: integer;
begin
  Head := 0;
  Tail := 0;
  repeat
    Writeln('1. Enqueue');
    Writeln('2. Dequeue');
    Writeln('3. Print Queue');
    Writeln('4. Exit');
    Write('Enter your option: ');
    Readln(Option);
    case Option of
      1:
        begin
          Write('Enter value to enqueue: ');
          Readln(Option);
          Enqueue(Option);
          clrscr();
        end;
      2:
        begin
          Dequeue;
          Writeln('Dequeued.');
          clrscr();
        end;
      3: PrintQueue;
    end;
  until Option = 4;
end.