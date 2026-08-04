import { useState, type ReactNode } from "react";
import { Maximize2 } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Dialog, DialogContent } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";

interface ChartCardProps {
  title: string;
  subtitle?: string;
  /** O gráfico. Use ResponsiveContainer com height="100%" para preencher. */
  children: ReactNode;
  /** Conteúdo extra que aparece SÓ em tela cheia (tabela, filtros de período…). */
  detail?: ReactNode;
  /** Botões no cabeçalho (ex: baixar). */
  actions?: ReactNode;
  /** Altura do gráfico no card. */
  height?: number;
  /** Altura do gráfico em tela cheia. */
  expandedHeight?: number;
  className?: string;
}

/**
 * Envolve qualquer gráfico num card bonito com botão de "tela cheia".
 * Ao expandir, o gráfico abre grande e mostra o conteúdo de `detail`
 * (que não cabia no card pequeno) — o clique entrega mais, não só zoom.
 */
export function ChartCard({
  title,
  subtitle,
  children,
  detail,
  actions,
  height = 240,
  expandedHeight = 460,
  className,
}: ChartCardProps) {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Card className={`card-premium ${className || ""}`}>
        <CardHeader className="flex flex-row items-start justify-between gap-2 space-y-0 pb-2">
          <div className="min-w-0">
            <CardTitle className="text-base truncate">{title}</CardTitle>
            {subtitle && <CardDescription className="text-xs">{subtitle}</CardDescription>}
          </div>
          <div className="flex items-center gap-1 shrink-0">
            {actions}
            <Button
              variant="ghost"
              size="icon"
              className="h-8 w-8 text-muted-foreground hover:text-primary"
              title="Ver em tela cheia"
              aria-label="Ver em tela cheia"
              onClick={() => setOpen(true)}
            >
              <Maximize2 className="h-4 w-4" />
            </Button>
          </div>
        </CardHeader>
        <CardContent>
          <div style={{ width: "100%", height }}>{children}</div>
        </CardContent>
      </Card>

      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent className="max-w-5xl">
          <div className="flex items-start justify-between gap-3 mb-3">
            <div className="min-w-0">
              <h2 className="text-lg font-semibold truncate">{title}</h2>
              {subtitle && <p className="text-sm text-muted-foreground">{subtitle}</p>}
            </div>
            {actions && <div className="flex items-center gap-1 shrink-0">{actions}</div>}
          </div>
          <div style={{ width: "100%", height: expandedHeight }}>{children}</div>
          {detail && <div className="mt-4 border-t pt-4">{detail}</div>}
        </DialogContent>
      </Dialog>
    </>
  );
}
