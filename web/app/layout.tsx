import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = {
  title: "MANASIK — Hajj & Umrah Companion",
  description: "A multilingual digital companion for Hajj and Umrah pilgrims.",
};
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
