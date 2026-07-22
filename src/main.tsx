import { createRoot } from "react-dom/client";
import App from "./App.tsx";
import { installSupabaseTracker } from "./lib/dev/supabase-tracker";
// DEV-only: rastreia todas as payloads de/para o Supabase (window.__supabaseTraffic / __dumpTraffic()).
if (import.meta.env.DEV) installSupabaseTracker();
// design system fonts (Inter + IBM Plex Mono) — remover esta linha reverte
import "./domani-fonts.css";
import "./index.css";
// design system tokens --dm-* (define o namespace p/ bos-web/effects/motion) — remover reverte
import "./domani-tokens.css";
import "./domani-ds.tokens.css"; // design system re-skin (shadcn bridge, !important) — remover esta linha reverte
import "./domani-bosweb.css";    // design system bos-web layer (card-premium/eyebrow/text-h2/gradiente) — reversível
import "./domani-effects.css";   // design system effects (glow/glass/shimmer) — reversível
// Bilhon Light Violeta — tema ÚNICO light. Sem alternância dark, sem data-theme legado.
(function () {
  try {
    document.documentElement.classList.remove("dark");
    document.documentElement.classList.add("light");
    document.documentElement.removeAttribute("data-theme");
    document.documentElement.removeAttribute("data-product");
    localStorage.setItem("app_theme", "light");
  } catch (e) {
    document.documentElement.classList.add("light");
  }
})();
import "./domani-effects.js";    // engine (magnetic/tilt/reveal) — reversível

createRoot(document.getElementById("root")!).render(<App />);
