unit Rate_U;

interface

type
  TRate = class(TObject) // ›∆… «·„” Œœ„ („” ÊÏ «· ’‰Ì› „‰ √Ã· «· ”⁄Ì—)
  private
    FNameRate: String;
    FPriceHour: Currency;
  protected

  public
    property NameRate: String read FNameRate write FNameRate; // «·Ã·”…
    property PriceHour: Currency read FPriceHour write FPriceHour; // «·Ã·”…
  end;

implementation

{ TRate }

end.
