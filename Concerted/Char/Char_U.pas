unit Char_U;

interface

// ************* «Ã»«— «·„” Œœ„ ·ﬂ «»… Õ—Ê› „Õœœ… œ«Œ· Edit *****************
function CharArabic(Key: Char): Boolean; // «·Õ—Ê› «·⁄—»Ì…
function CharFrenshe(Key: Char): Boolean; // «·Õ—Ê› «·›—‰”Ì…
function CharAnglesh(Key: Char): Boolean; // «·Õ—Ê› «·«‰Ã·Ì“Ì…
function CharTalisman(Key: Char): Boolean; // ÿ·«”„
function CharSignText(Key: Char): Boolean; // ⁄·«„…  ‰’Ì’
function CharMath(Key: Char): Boolean; // —„Ê“ «·—Ì«÷Ì« 

implementation

// ************* «Ã»«— «·„” Œœ„ ·ﬂ «»… Õ—Ê› „Õœœ… œ«Œ· Edit *****************

function CharAnglesh(Key: Char): Boolean;
begin
  if (Key in ['a' .. 'z', 'A' .. 'Z']) then
    Result := True
  else
    Result := False;
end;

function CharArabic(Key: Char): Boolean;
begin
  if (Key in [#1, #2, #3, #4, #5, #6, #7, #10, #11, #12, #13, #14, #15, #127,
    #128, #131, #140, #149, #156, #160, #162, #165, #252, #250, #248, #246,
    #245, #243, #242, #241, #240, #237, #236, #230, #229, #228, #227, #225,
    #223, #222, #221, #219, #218, #217, #216, #214, #213, #212, #211, #210,
    #209, #208, #207, #206, #205, #204, #203, #202, #201, #200, #199, #198,
    #197, #196, #195, #194, #193, #185, #181, #180, #179, #178, #176, #175,
    #173, #172]) then
    Result := True
  else
    Result := False;
end;

function CharTalisman(Key: Char): Boolean;
begin
  if (Key in [#16, #17, #18, #19, #20, #21, #22, #23, #24, #25, #26, #27, #35,
    #36, #124, #129, #132, #133, #134, #135, #138, #139, #141, #142, #143,
    #144, #150, #151, #152, #153, #154, #155, #159, #163, #164, #166, #167,
    #168, #169, #170, #171, #174, #176, #182, #183, #184, #187, #188, #189,
    #190, #192, #215, #255]) then
    Result := True
  else
    Result := False;
end;

function CharFrenshe(Key: Char): Boolean;
begin
  if (Key in [#224, #226, #231 .. #235, #244, #249, #251]) then
    Result := True
  else
    Result := False;
end;

function CharSignText(Key: Char): Boolean;
begin
  if (Key in [#33, #34, #35, #36, #38, #39, #40, #41, #44, #45, #46, #58, #59,
    #63, #64, #91, #93, #94, #95, #96, #123, #124, #125, #126, #130, #132,
    #136, #139, #145, #146, #147, #148, #150, #151, #155, #163, #171, #186,
    #187, #191, #220]) then
    Result := True
  else
    Result := False;
end;

function CharMath(Key: Char): Boolean;
begin
  if (Key in [#37, #42, #43, #45, #47, #60, #61, #62, #92, #137, #177, #188,
    #189, #190, #215, #247]) then
    Result := True
  else
    Result := False;
end;

end.
